class MatkasController < ApplicationController


  
  before_action :authenticate_user!
  before_action :set_matka, only: [:show, :edit, :update, :destroy]
  before_action :owned_matka, only: [:edit, :update, :destroy]
  
  # GET /matkas
  # GET /matkas.json
  def index
    @matkas = Matka.all
	
	#http://api.rubyonrails.org/classes/ActionController/MimeResponds.html
	respond_to do |format|
    format.html
    format.xml {render :xml => @matkas}
	format.json {render :json => @matkas}
	end
  end

  # GET /matkas/1
  # GET /matkas/1.json
  def show
	#http://api.rubyonrails.org/classes/ActionController/MimeResponds.html
	respond_to do |format|
    format.html
    format.xml {render :xml => @matka}
	format.json {render :json => @matka}
	end
  end

##vanhat koodinpatkat on merkitty näin.    
  
  # GET /matkas/new
  def new
##    @matka = Matka.new
	@matka = current_user.matkas.build
  end

  # GET /matkas/1/edit
  def edit
  end

  # POST /matkas
  # POST /matkas.json
  def create
##    @matka = Matka.new(matka_params)
	@matka = current_user.matkas.build(matka_params)


    respond_to do |format|
      if @matka.save
##        format.html { redirect_to @matka, notice: 'Matka was successfully created.' }
		format.html { 
		flash[:success] = "Your matka has been created!"
        redirect_to root_path
		}
		
        format.json { render :show, status: :created, location: @matka }
      else
##        format.html { render :new }
		format.html { 
		flash[:alert] = "Your new matka couldn't be created! Please check the form"
		render :new 
		}
		
        format.json { render json: @matka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matkas/1
  # PATCH/PUT /matkas/1.json
  def update
    respond_to do |format|
      if @matka.update(matka_params)
##        format.html { redirect_to @matka, notice: 'Matka was successfully updated.' }
		format.html { 
		flash[:success] = "Ride updated."
		redirect_to root_path 
		}

        format.json { render :show, status: :ok, location: @matka }
      else
##        format.html { render :edit }
		format.html { 
		flash[:alert] = "Update failed.  Please check the form."
		render :edit 
		}
		
        format.json { render json: @matka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matkas/1
  # DELETE /matkas/1.json
  def destroy
    @matka.destroy
    respond_to do |format|
##      format.html { redirect_to matkas_url, notice: 'Matka was successfully destroyed.' }
	  format.html { 
	  flash[:success] = "Your ride has been deleted."
	  redirect_to root_path 
	  }

      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matka
      @matka = Matka.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

###tämä tässä täysin uutta
    def matka_params
      params.require(:matka).permit(:mista, :mihin, :kulkuneuvo, :lahto, :paluu, :matkaseurue, :lisatietoja)
    end
	
	def owned_matka
	  unless current_user == @matka.user
		flash[:alert] = "That matka does not belong to you."
		redirect_to root_path
	  end
	end
	
end
