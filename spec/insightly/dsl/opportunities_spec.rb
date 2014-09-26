require 'spec_helper'

describe Insightly::DSL::Opportunities do
  # DELETE /v2.1/Opportunities/{c_id}/Image
  describe '#delete_opportunity_image' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_opportunity_image(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # DELETE /v2.1/Opportunities/{id}
  describe '#delete_opportunity' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_opportunity(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Emails
  describe '#get_opportunity_emails' do
    it 'returns an opportunity emails' do
      emails = Insightly.client.get_opportunity_emails(id: 1)
      expect(emails).to be_a(Array)
      expect(emails.first).to be_a(Insightly::Resources::Email)
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Image
  describe '#get_opportunity_image' do
    xit 'returns an opportunity image' do
      image = Insightly.client.get_opportunity_image(id: 1)
      expect(image).to be_a(Array)
      expect(image.first).to be_a(Insightly::Resources::Opportunity)
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Notes
  describe '#get_opportunity_notes' do
    it 'returns an opportunity notes' do
      notes = Insightly.client.get_opportunity_notes(id: 1)
      expect(notes).to be_a(Array)
      expect(notes.first).to be_a(Insightly::Resources::Note)
    end
  end

  # GET /v2.1/Opportunities/{c_id}/StateHistory
  describe '#get_opportunity_state_history' do
    it 'returns an opportunity state history' do
      state_history = Insightly.client.get_opportunity_state_history(id: 1)
      expect(state_history).to be_a(Array)
      expect(state_history.first).to be_a(Insightly::Resources::OpportunityStateReason)
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Tasks
  describe '#get_opportunity_tasks' do
    it 'returns an opportunity tasks' do
      tasks = Insightly.client.get_opportunity_tasks(id: 1)
      expect(tasks).to be_a(Array)
      expect(tasks.first).to be_a(Insightly::Resources::Task)
    end
  end

  # GET /v2.1/Opportunities/{id}
  describe '#get_opportunity' do
    it 'returns an opportunity' do
      expect(Insightly.client.get_opportunity(id: 1)).to be_a(Insightly::Resources::Opportunity)
    end
  end

  # GET /v2.1/Opportunities?ids={ids}&tag={tag}
  describe '#get_opportunities' do
    it 'returns an array of opportunities' do
      opportunities = Insightly.client.get_opportunities
      expect(opportunities).to be_a(Array)
      expect(opportunities.first).to be_a(Opportunity)
    end
  end

  # POST /v2.1/Opportunities
  describe '#create_opportunities' do
    it 'creates and returns an opportunity' do
      expect(Insightly.client.create_opportunity(opportunity: {})).to be_a(Insightly::Resources::Opportunity)
    end
  end

  # POST /v2.1/Opportunities/{c_id}/Image/{filename}
  describe '#create_opportunity_image' do
    xit 'returns 201' do
      response = Insightly.client.create_opportunity_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end

  # PUT /v2.1/Opportunities
  describe '#update_opportunities' do
    it 'updates and returns an opportunity' do
      expect(Insightly.client.update_opportunity(opportunity: {id: 1})).to be_a(Insightly::Resources::Opportunity)
    end
  end

  # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
  describe '#update_opportunity_image' do
    xit 'returns 201' do
      response = Insightly.client.update_opportunity_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end
end