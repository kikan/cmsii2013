class CategoriesController < ApplicationController
  before_action :set_categorie, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Categorie.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @categorie = Categorie.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @categorie = Categorie.new(categorie_params)

    respond_to do |format|
      if @categorie.save
        sauve_fichier_pour @categorie
        format.html { redirect_to @categorie, notice: 'Categorie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @categorie }
      else
        format.html { render action: 'new' }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @categorie.update(categorie_params)
        sauve_fichier_pour @categorie
        format.html { redirect_to @categorie, notice: 'Categorie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @categorie.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  def sauve_fichier_pour(o)
    return unless @uploaded_io
    # Création d'un répertoire pour stocker l'image
    chemin_stockage_fichiers = Rails.root.join('public', 'uploads', o.class.table_name).to_s
    FileUtils.mkdir_p chemin_stockage_fichiers

    # Stockage
    if @uploaded_io.is_a? ActionDispatch::Http::UploadedFile
      FileUtils.mv @uploaded_io.tempfile, chemin_stockage_fichiers+"/#{o.id}"
    else
      File.open(chemin_stockage_fichiers+"/#{o.id}", 'wb') do |file|
        file.write(@uploaded_io.read)
      end    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorie
      @categorie = Categorie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categorie_params
      @uploaded_io = params.delete(:file)||params[:categorie].delete(:fichier_image)
      params.require(:categorie).permit(:libelle, :fichier_image, objets_attributes:[:id, :libelle, :valeur, :_destroy])
    end
end
