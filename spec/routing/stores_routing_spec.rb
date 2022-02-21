require 'rails_helper'

RSpec.describe StoresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/stores').to route_to('stores#index')
    end

    it 'does not routes to #new' do
      expect(get: '/stores/new').not_to route_to('stores#new')
    end

    it 'does not routes to #show' do
      expect(get: '/stores/1').not_to route_to('stores#show', id: '1')
    end

    it 'does not routes to #edit' do
      expect(get: '/stores/1/edit').not_to route_to('stores#edit', id: '1')
    end

    it 'does not routes to #create' do
      expect(post: '/stores').not_to route_to('stores#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: '/stores/1').not_to route_to('stores#update', id: '1')
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: '/stores/1').not_to route_to('stores#update', id: '1')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/stores/1').not_to route_to('stores#destroy', id: '1')
    end
  end
end
