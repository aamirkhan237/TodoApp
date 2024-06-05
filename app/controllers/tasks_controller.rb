class TasksController < ApplicationController
    def index
        @task = Task.new
        
        # @tasks = if params[:status].present?  && params[:status] != 'All'
        #         Task.where(status: params[:status])
        #        else
        #          Task.all
        #        end
        @q = Task.ransack(params[:q])
        if params[:q] && params[:q][:status_eq] == 'All'
            @tasks = Task.all
        else
            @tasks = @q.result(distinct: true)
          end
        # @q = Task.ransack(params[:q])
        # @tasks = @q.result(distinct: true)
    end
    def show
      @task = Task.find(params[:id])
    end
  
    # def new
    #   @task = Task.new
    # end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        @q = Task.ransack(params[:q])
        @tasks = @q.result(distinct: true)
        # @tasks = Task.all
        render :index
      end
    end
  
    def edit
      @task = Task.find(params[:id])
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end
  end
  