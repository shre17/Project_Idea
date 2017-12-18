class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /ideas
  # GET /ideas.json
  def index
    if current_user.role == 'admin'
      @ideas = Idea.all
    else
      @ideas = current_user.ideas
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @idea.attachments.build
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        @user = User.find_by(role: "admin")
        UserMailer.idea_notification_to_admin(@user, @idea).deliver_now
        @admin = User.find_by(role: "admin")
        UserMailer.notification_to_idea_creator(@admin, @idea.user, @idea).deliver_now
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    attachment = @idea.attachments
    respond_to do |format|
      if @idea.update(idea_params)
        updated_attachments = @idea.attachments - attachment
        @user = User.find_by(role: "admin")
        UserMailer.update_notification_to_admin(@admin, @idea.user, @idea, updated_attachments).deliver_now
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
   end
 end

# def my_mail
#     # get absolute path of temporary location uploaded file
#     attachment_tmp_path = File.absolute_path(params[:idea_attachment].tempfile)
#     UserMailer.delay.my_mail(attachment_tmp_path)
# end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:idea_title, :idea_descripition, :idea_attachment, :user_id,attachments_attributes: [:attachment_name, :attachable_type, :attachable_id, :_destroy])
    end
end
        # UserMailer.idea_notification_to_user(@idea.user, @idea).deliver_now
