class DocumentsController < ApplicationController
  before_filter :find_patient
  
  def index
    @documents = @patient.documents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  def show
    @document = @patient.documents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  def edit
    @document = @patient.documents.find(params[:id])
  end

  def create
    @document = Document.new(params[:document])
    @document.patient = @patient

    respond_to do |format|
      if @document.save
        format.html { redirect_to @patient, notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @document = @patient.documents.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to patient_document_url(@patient, @document), notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document = @patient.documents.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to patient_documents_url(@patient) }
      format.json { head :no_content }
    end
  end
  
  private
  def find_patient
    @patient = Patient.find(params[:patient_id])
  end
end
