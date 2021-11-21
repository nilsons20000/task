class IteamsController < ApplicationController
  def index
       @iteams = Iteam.all
  end  

  def show
      @iteam = Iteam.find(params[:id])
  end

  def new
      @iteam = Iteam.new
  end

  # def edit
  #     @iteam = Iteam.find(params[:id])
  #   end

  def create
      @iteam = Iteam.new(iteam_params)
      if @iteam.save
          redirect_to @iteam
      else
          render 'new'
      end
  end

  def set_iteam
    @iteam = Iteam.find(params[:id])
  end

  # def update
  #     @iteam = Iteam.find(params[:id])
  #     Iteam.where(params[:id]).update_all(:status => 'progress')
  #     if @iteam.update(iteam_params)
  #         redirect_to @iteam
  #       else
  #         render 'edit'
  #       end
  #   end

  def edit
    @iteam = Iteam.find(params[:id])
  end

  def edit_me
    @iteam = Iteam.find(params[:id])
  end
 
   def update_me
      @iteams = Iteam.where(id: params[:id])
      id_task = @iteams
      done_items = @iteams.where(status: 'Done').pluck(:id)
      progress_items = @iteams.where(status: 'Progress').pluck(:id)
      Tasker.where(iteam: progress_items).update_all(status: 'Done')
      Tasker.where(iteam: done_items).update_all(status: 'Progress')
      @iteams.where(id: done_items).update(status: 'Progress')
      @iteams.where(id: progress_items).update(status: 'Done')
      redirect_to "/iteams"
   end


   def edit_iteam
    @iteam = Tasker.find(params[:id])
  end
 
   def update_iteam
      @task = Tasker.where(id: params[:id])
      done_items = @task.where(status: 'Done').pluck(:id)
      progress_items = @task.where(status: 'Progress').pluck(:id);
      @task.where(id: done_items).update(status: 'Progress').pluck(:id)
      @task.where(id: progress_items).update(status: 'Done').pluck(:id)  
      redirect_to "/iteams"
   end  

  private
      def iteam_params
        params.require(:iteam).permit(:title, :text, :status)
      end
end
