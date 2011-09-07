class NetworkManagementsController < ApplicationController
   # GET /network_managements
   # GET /network_managements.xml
   def index
      @ips = NetworkManagement.all

      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @network_managements }
      end
   end

   # GET /network_managements/1
   # GET /network_managements/1.xml
   def show
      @network_management = NetworkManagement.find(params[:id])

      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @network_management }
      end
   end

   # GET /network_managements/new
   # GET /network_managements/new.xml
   def new
      @network_management = NetworkManagement.new

      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @network_management }
      end
   end

   # GET /network_managements/1/edit
   def edit
      @network_management = NetworkManagement.find(params[:id])
   end

   # POST /network_managements
   # POST /network_managements.xml
   def create
      #@network_management = NetworkManagement.new(params[:network_management])
      @ip = IPAddress "#{params[:network_management][:ip]}/#{params[:network_management][:ip_range]}"
      @ip.each do |addr|
         @network_management = NetworkManagement.new params[:network_management]
         @network_management.ip = addr.to_s
         @network_management.save
      end
      respond_to do |format|

         format.html { redirect_to(network_managements_path,
         notice:'IP was successfully created.') }


      end
   end

   # PUT /network_managements/1
   # PUT /network_managements/1.xml
   def update
      @network_management = NetworkManagement.find(params[:id])

      respond_to do |format|
         if @network_management.update_attributes(params[:network_management])
            format.html { redirect_to(@network_management, :notice => 'Network management was successfully updated.') }
            format.xml  { head :ok }
         else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @network_management.errors, :status => :unprocessable_entity }
         end
      end
   end

   # DELETE /network_managements/1
   # DELETE /network_managements/1.xml
   def destroy
      @network_management = NetworkManagement.find(params[:id])
      @network_management.destroy

      respond_to do |format|
         format.html { redirect_to(network_managements_url) }
         format.xml  { head :ok }
      end
   end
   def get_ip
      @ip = IPAddress "#{params[:ip]}/#{params[:ip_range]}"
      respond_to do |format|
         format.js
      end
   end
end
