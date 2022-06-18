class ClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_claim, only: %i[update show edit destroy ]
 
  def index
    @claims = Claim.all
    @tasks=Task.all
  end

  def new
    @claim = Claim.new
    @task = Task.new
  end

  def create
    @claim = Claim.new(claim_params)
    if @claim.save
      redirect_to claims_path, notice:  t('shared.new')
    else
      render :new, notice: t('shared.failure_new') 
    end
  end

  def update
    if @claim.update(claim_params)
      redirect_to claims_path, notice:  t('shared.update')
    else 
      render :edit 
    end
  end

  def edit
  end

  def destroy
    @claim.destroy
    redirect_to claims_path, notice: t('shared.delete')
  end

  def show
    @task = Task.find(@claim.task_id)
    @agent =Agent.find_by(task_id: @claim.task_id)
  end

  private
  def claim_params
    params.require(:claim).permit(:id,:task_id,:troubled_at, :category, :content,:support_content, :created_at, :updated_at)
  end

  def set_claim
    @claim = Claim.find(params[:id])
  end
end
