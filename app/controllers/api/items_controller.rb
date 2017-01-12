class Api::ItemsController < ApiController

  before_action :authenticated?

  def create
     list = List.find(params[:list_id])
     item = list.items.build(item_params)
     if item.save
      render json: item
     else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def update
     puts JSON.pretty_generate params
     item = Item.find(params[:id])
     if item.update(item_params)
       render json: item
     else
       render :json => { :errors => list.errors.full_messages }
     end
   end

   def destroy
     begin
       item = Item.find(params[:id])
       item.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   private

   def item_params
      params.require(:item).permit(:name, :completed)
   end

end
