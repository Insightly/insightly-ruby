require 'spec_helper'

describe Insightly::DSL::Emails do
  # GET /v2.1/Emails/{id}
  describe '#get_email' do
    it 'returns an email' do
      expect(Insightly.client.get_email(id: 1)).to be_a(Email)
    end
  end

  # GET /v2.1/Emails?ids={ids}&tag={tag}
  describe '#get_emails' do
    xit 'returns an array of emails' do
      emails = Insightly.client.get_emails
      expect(emails).to be_a(Array)
      expect(emails.first).to be_a(Email)
    end
  end

  # GET /v2.1/Emails/{c_id}/Comments
  describe '#get_email_comments' do
    xit 'returns an array of comments' do
      emails = Insightly.client.get_email_comments(id: 1)
      expect(emails).to be_a(Array)
      expect(emails.first).to be_a(Comment)
    end
  end

  # POST /v2.1/Emails/{c_id}/Comments
  describe '#create_email_comments' do
    xit 'creates and returns comment' do
      expect(Insightly.client.create_email_comments(id: 1, comment: {title: ''})).to be_a(Comment)
    end
  end

  # DELETE /v2.1/Emails/{id}
  describe '#delete_email' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_email(id: 1)
      expect(response.status).to eq(202)
    end
  end
end