require 'rails_helper'

RSpec.describe ImportationsController, type: :routing do
  describe 'routing' do
    it 'does not routes to #index' do
      expect(get: '/importations').not_to route_to('importations#index')
    end

    it 'routes to #new' do
      expect(get: '/importations/new').to route_to('importations#new')
    end

    it 'does not routes to #show' do
      expect(get: '/importations/1').not_to route_to('importations#show', id: '1')
    end

    it 'does not routes to #edit' do
      expect(get: '/importations/1/edit').not_to route_to('importations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/importations').to route_to('importations#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: '/importations/1').not_to route_to('importations#update', id: '1')
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: '/importations/1').not_to route_to('importations#update', id: '1')
    end

    it 'does not routes to #destroy' do
      expect(delete: '/importations/1').not_to route_to('importations#destroy', id: '1')
    end
  end
end
