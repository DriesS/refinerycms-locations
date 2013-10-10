module Refinery
	module Locations
		module Admin
			class RegionsController < ::Refinery::AdminController
			  crudify :'refinery/locations/region'

				def create
				  # if the position field exists, set this object as last object, given the conditions of this class.
				  if Refinery::Locations::Region.column_names.include?("position") && params[:region][:position].nil?
				    params[:region].merge!({
				      :position => ((Refinery::Locations::Region.maximum(:position, :conditions => "")||-1) + 1)
				    })
				  end

				  if (@region = Refinery::Locations::Region.create(params[:region])).valid?
				    flash.notice = t(
				      'refinery.crudify.created',
				      :what => "'#{@region.title}'"
				    )

				    unless from_dialog?
				      unless params[:continue_editing] =~ /true|on|1/
				        redirect_back_or_default(refinery.locations_admin_regions_path)
				      else
				        unless request.xhr?
				          redirect_to :back
				        else
				          render :partial => '/refinery/message'
				        end
				      end
				    else
				      self.index
				      @dialog_successful = true
				      render :index
				    end
				  else
				    unless request.xhr?
				      render :action => 'new'
				    else
				      render :partial => '/refinery/admin/error_messages', :locals => {
				               :object => @region,
				               :include_object_name => true
				             }
				    end
				  end
				end
				def update
				  if @region.update_attributes(params[:region])
				    flash.notice = t(
				      'refinery.crudify.updated',
				      :what => "'#{@region.title}'"
				    )

				    unless from_dialog?
				      unless params[:continue_editing] =~ /true|on|1/
				        redirect_back_or_default(refinery.locations_admin_regions_path)
				      else
				        unless request.xhr?
				          redirect_to :back
				        else
				          render :partial => '/refinery/message'
				        end
				      end
				    else
				      self.index
				      @dialog_successful = true
				      render :index
				    end
				  else
				    unless request.xhr?
				      render :action => 'edit'
				    else
				      render :partial => '/refinery/admin/error_messages', :locals => {
				               :object => @region,
				               :include_object_name => true
				             }
				    end
				  end
				end

		  end
		end
	end		
end


