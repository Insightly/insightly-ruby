require 'spec_helper'

describe Insightly2::DSL::Emails do
  let(:email_id) { 17683283 }

  # GET /v2.1/Emails/{id}
  describe '#get_email' do
    it 'returns an email' do
      VCR.use_cassette('get_email') do
        expect(Insightly2.client.get_email(id: email_id)).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Emails?ids={ids}&tag={tag}
  describe '#get_emails' do
    it 'returns an array of emails' do
      VCR.use_cassette('get_emails') do
        emails = Insightly2.client.get_emails
        expect(emails).to be_a(Array)
        expect(emails.first).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Emails/{c_id}/Comments
  describe '#get_email_comments' do
    it 'returns an array of comments' do
      VCR.use_cassette('get_email_comments') do
        comments = Insightly2.client.get_email_comments(id: email_id)
        expect(comments).to be_a(Array)
        expect(comments.first).to be_a(Comment)
      end
    end
  end

  # POST /v2.1/Emails/{c_id}/Comments
  describe '#create_email_comment' do
    it 'returns a response with code 201' do
      VCR.use_cassette('create_email_comment') do
        response = Insightly2.client.create_email_comment(id: email_id, comment: {title: 'Sharknado'})
        expect(response.status).to eq(201)
      end
    end
  end

  # DELETE /v2.1/Emails/{id}
  describe '#delete_email' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_email') do
        response = Insightly2.client.delete_email(id: email_id)
        expect(response.status).to eq(202)
      end
    end
  end
end