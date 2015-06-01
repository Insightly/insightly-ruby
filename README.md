# Insightly2

Ruby Library for the Insightly REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insightly2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insightly2
    
The gem requires Ruby 2.0.0 and above.    

## Sample Code

Set client the API key.
```ruby
Insightly2.api_key = <your API key>
```

Get contacts.
```ruby
contacts = Insightly2.client.get_contacts
```

Get a contact.
```ruby
contact = Insightly2.client.get_contact(id: 1)
```

Create a contact.

```ruby
# Build JSON serialized attributes.
# The gem won't do this for you. You need to build a serializer that meets your needs."
contact_attributes = {
  "first_name"=>"Tyler", 
  "last_name"=>"Durden", 
  "image_url"=>"https://fakedomain.imgix.net/user_photos/man.jpg?crop=faces&fit=crop&h=96&w=96", 
  "contactinfos"=>[{"contact_info_id"=>0, "type"=>"Email", "subtype"=>"", "label"=>"Work", "detail"=>"tylerdurden@ucsv.edu"}], 
  "links"=>[], 
  "tags"=>[], 
  "date_created_utc"=>"2014-10-11 23:20:04", 
  "date_updated_utc"=>"2014-10-23 17:27:25", 
  "contact_id"=>81126408
}

# Create the contact.
contact = Insightly2.client.create_contact(contact: contact_attributes)
```

Update a contact.
```ruby
# Build JSON serialized attributes.
# The gem won't do this for you. You need to build a serializer that meets your needs."
# contact_attributes = <same as create>

# Update the contact.
contact = Insightly2.client.update_contact(contact: contact_attributes)
```

Delete a contact.
```ruby
Insightly2.client.delete_contact(id: 1)
```

## Error handling

The client will raise an ```Insightly2::Errors::ClientError``` if the action failed or
an ```Insightly2::Errors::ResourceNotFoundError``` if the target resource cannot be found in the API.

Depending on your implementation you may want to rescue these errors as follows:

```ruby
begin
  Insightly2.client.delete_contact(id: 1)
rescue Insightly2::Errors::ResourceNotFoundError => e
  Rails.logger.error "Insightly contact not found: #{e.response}"
rescue Insightly2::Errors::ClientError => e
  Rails.logger.error "Insightly contact delete failed: #{e.response}"
end
```    
If you don't care whether or not the resource is found you can simply do the following:

```ruby
begin
  Insightly2.client.delete_contact(id: 1)
rescue Insightly2::Errors::ClientError => e
  Rails.logger.error "Insightly contact delete failed: #{e.response}"
end
```
This will also catch ```Insightly2::Errors::ResourceNotFoundError``` but is less specific.

## API docs

[Insightly API Documentation](https://api.insight.ly/v2.1/Help)

## Contributing

1. Fork it ( https://github.com/insightly/ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
