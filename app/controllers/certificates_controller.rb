class CertificatesController < ApplicationController
  def new
    @ca = Ca.find params[:ca_id]
  end

  def create
    @ca = Ca.find params[:ca_id]
    @certificate = Certificate.create certificate_params
    @ca.certificates << @certificate
    @ca.save
    @certificate.save

    redirect_to ca_path(@ca)
  end

  def index
    puts @ca
  end

  def show
    @ca = Ca.find 1
    @certificates = @ca.certificates.all
  end

  private
  def certificate_params
    params.require(:certificate).permit(:ca_id, :subject, :issuer, :serial_number, :not_before, :not_after)
  end
end
