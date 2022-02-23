class StoresController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @stores = Store.all
  end
end
