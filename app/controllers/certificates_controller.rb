class CertificatesController < ApplicationController
  include OpenSSL

  def new
    @ca = Ca.find params[:ca_id]
  end

  def create
    @ca = Ca.find params[:ca_id]
    @certificate = Certificate.create certificate_params
    @ca.certificates << @certificate
    #------------------------------------------------------
    key = PKey::RSA.new 2048
    name = X509::Name.parse 'CN=fshahy/DC=com'

    cert = X509::Certificate.new
    cert.version = 3
    cert.serial = certificate_params[:serial_number].to_i(16)
    cert.not_before = Time.now
    cert.not_after = Time.now + 3600 * 24 * 365

    cert.public_key = key.public_key
    cert.subject = name
    cert.issuer = name

    ef = X509::ExtensionFactory.new
    bc = ef.create_extension 'basicConstraints', 'CA:TRUE'
    ku = ef.create_extension 'keyUsage', 'keyEncipherment,dataEncipherment,digitalSignature'
    ef.subject_certificate = cert
    ef.issuer_certificate = cert
    ski = ef.create_extension 'subjectKeyIdentifier', 'hash'

    cert.add_extension bc
    cert.add_extension ku
    cert.add_extension ski

    cert.sign key, Digest::SHA256.new

    @certificate.cert_pem = cert.to_pem
    #------------------------------------------------------
    @ca.save
    @certificate.save

    redirect_to ca_path(@ca)
  end

  def index
    puts @ca
  end

  def show
    @ca = Ca.find params[:ca_id]
    @cert = @ca.certificates.find params[:id]
    @certificates = @ca.certificates.all

    puts @cert.cert_pem.to_s
    send_data @cert.cert_pem.to_s, :filename => "#{@cert.serial_number.to_s}.cert"
  end

  private
  def certificate_params
    params.require(:certificate).permit(:ca_id, :subject, :issuer, :serial_number, :not_before, :not_after)
  end
end
