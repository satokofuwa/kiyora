class AgentsController < ApplicationController
  class AgentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_search
    before_action :set_agent, only: [:destroy,:edit,:update,:show]
  
    def index
      
      @agents = Agent.all
      @q= Agent.ransack(params[:q])
      @agents = @q.result(distinct: true).order(created_at: :desc)
    end
  
    def new
      @q= Agent.ransack(params[:q])
      @agents = @q.result(distinct: true).order(created_at: :desc)
    end
  
    def create
      @agent = Agent.new(agent_params)
      flash[:notice] = if @agent.save!
        '登録が完了しました。'
      else
        'エラーが発生しました。'
      end
      redirect_to new_agent_url
    end
  
    def update
      @agent = Agent.new(agent_params)
      if @agent.update( agent_params)
        redirect_to tasks_path, notice:  t('shared.update')
      else 
        render :edit 
      end
    end
  
    def edit
    end
  
    def destroy
      @agent.destroy
      redirect_to agents_path, notice: t('shared.delete')
    end
  
    private
  
    def set_search
      @q = Agent.ransack(params[:q])
      @results = @q.result.includes(:tasks)
    end
   
  
    def agent_params 
    
     params.require(:agent).permit(:id,:task_id,:name,:zip,:prefecture,:city,:address,:tel,:manager_name,:created_at,:updated_at)
    end
  
    def set_agent
      @agent = Agent.find(params[:id])
    end
  
  end
end
