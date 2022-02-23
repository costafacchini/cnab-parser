class ImportationsController < ApplicationController
  def create
    @importation = Importation.new(importation_params)
    uploaded_file = params[:importation][:content]
    @importation.content = uploaded_file.read if uploaded_file.present?

    respond_to do |format|
      if @importation.save
        ImportationJob.perform_later(@importation.id)

        format.html { redirect_to stores_path, notice: 'Importation was successfully created.' }
        format.json { render :nothing, status: :created }
      else
        format.html { redirect_to stores_path, notice: 'Importation was error.' }
        format.json { render json: @importation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def importation_params
    params.permit(:content)
  end
end
