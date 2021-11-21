class TaskersController < ApplicationController

    def create
        @iteam = Iteam.find(params[:iteam_id])
        @task = @iteam.taskers.create(task_params)
        redirect_to iteam_path(@iteam)
      end
      
    private
      def task_params
        params.require(:tasker).permit(:task, :body, :status)
      end
      
end
