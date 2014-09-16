require 'spec_helper'

describe Insightly::DSL::Emails do
  # DELETE /v2.1/Emails/{id}
  describe '#delete_email' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_email(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Emails/{c_id}/Comments

  # GET /v2.1/Emails?ids={ids}&tag={tag}
  describe '#get_emails' do
    it 'returns an array of emails' do
      emails = Insightly.client.get_emails
      expect(emails).to be_a(Array)
      expect(emails.first).to be_a(Email)
    end
  end

  # GET /v2.1/Emails/{id}
  describe '#get_email' do
    it 'returns an email' do
      expect(Insightly.client.get_email(1)).to be_a(Email)
    end
  end

  # POST /v2.1/Emails/{c_id}/Comments
end