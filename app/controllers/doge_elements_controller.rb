class DogeElementsController < ApplicationController

  private

    def doge_element_params
      params.require(:doge_element).permit(:name, :user_id)
    end
end

