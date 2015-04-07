class BountiesController < InheritedResources::Base

  private

    def bounty_params
      params.require(:bounty).permit(:user_id, :pet_id, :ghost_id, :number_of_bounties, :amount)
    end
end

