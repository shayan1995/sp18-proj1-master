class PokemonsController < ApplicationController

  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer_id = current_trainer.id
    @pokemon.save
  end



  def create
      @pokemon = Pokemon.new
      @pokemon.trainer_id = current_trainer.id
      @pokemon.health = 100
      @pokemon.level = 1
      @pokemon.update(pokemon_params)
      # @pokemon.ndex = ndx
      @pokemon.save!
      if @pokemon.save == false
      			flash[:error] = @pokemon.errors.full_messages.to_sentence
            redirect_to(new_path)
      else
        redirect_to trainer_path(current_trainer)
      end
      redirect_to trainer_path(current_trainer)
  end


  def index
        @pokemon = Pokemon.all
  end

  def new
    		@pokemon = Pokemon.new
  end

  
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    		if @pokemon.health <= 10
            @pokemon.destroy
            @pokemon.save
          return
        end
    @pokemon.health -= 10
    @pokemon.save
    redirect_to trainer_path(Trainer.find(@pokemon.trainer_id))
    end

end

