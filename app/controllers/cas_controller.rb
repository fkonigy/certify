class CasController < ApplicationController
  def new
    @ca = Ca.new
  end

  def create
    @ca = Ca.new ca_params

    if @ca.save
      redirect_to cas_path
    else
      render 'new'
    end

  end

  def index
    @cas = Ca.all
  end

  def show
    @ca = Ca.find(params[:id])
  end

  def destroy
    @ca = Ca.find params[:id]
    @ca.destroy

    redirect_to cas_path
  end

  private
  def ca_params
    params.require(:ca).permit(:name)
  end

end
