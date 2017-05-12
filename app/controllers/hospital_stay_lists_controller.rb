class HospitalStayListsController < ApplicationController
  before_action :set_hospital_stay_list, only: [:show, :edit, :update, :destroy]

  # GET /hospital_stay_lists
  # GET /hospital_stay_lists.json
  def index
    @hospital_stay_lists = HospitalStayList.all
  end

  # GET /hospital_stay_lists/1
  # GET /hospital_stay_lists/1.json
  def show
  end

  # GET /hospital_stay_lists/new
  def new
    @hospital_stay_list = HospitalStayList.new
  end

  # GET /hospital_stay_lists/1/edit
  def edit
  end

  # POST /hospital_stay_lists
  # POST /hospital_stay_lists.json
  def create
    @hospital_stay_list = HospitalStayList.new(hospital_stay_list_params)

    respond_to do |format|
      if @hospital_stay_list.save
        format.html { redirect_to @hospital_stay_list, notice: 'Hospital stay list was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_stay_list }
      else
        format.html { render :new }
        format.json { render json: @hospital_stay_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_stay_lists/1
  # PATCH/PUT /hospital_stay_lists/1.json
  def update
    if ((params[:hospital_stay_list][:ward_id])!=(params[:hospital_stay_list][:ward_attributes][:id]))
      params[:hospital_stay_list][:ward_attributes].clear
      ward=Ward.find(params[:hospital_stay_list][:ward_id])
      @hospital_stay_list.ward = ward
    end
    respond_to do |format|
      if @hospital_stay_list.update(hospital_stay_list_params)
        format.html { redirect_to @hospital_stay_list, notice: 'Hospital stay list was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_stay_list }
      else
        format.html { render :edit }
        format.json { render json: @hospital_stay_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_stay_lists/1
  # DELETE /hospital_stay_lists/1.json
  def destroy
    @hospital_stay_list.destroy
    respond_to do |format|
      format.html { redirect_to hospital_stay_lists_url, notice: 'Hospital stay list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_stay_list
      @hospital_stay_list = HospitalStayList.find(params[:id])
    end

    def check_ctr_auth()
      return true if (action_name.to_sym == :index or action_name.to_sym == :show)
      return @current_role_user.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_stay_list_params
      params.require(:hospital_stay_list).permit(:patient_id, :receipt_date, :reason, :discharge_date, :discharge_epicrisis, :ward_id,
      ward_attributes: [:id, :_destroy, :floor, :number, :departmen, :capacity],
      patients_attributes: [:id, :_destroy, :second_name, :first_name, :last_name, :number, :number_polis, :is_platnik, :data_created, :index, :town, :street, :house, :corpus, :flat, :telefone, :issued_by, :seria, :nomer, :date_of_issue, :allergy])
    end
end
