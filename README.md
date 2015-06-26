# SimpleSpreadsheets

Write Excel-friendly spreadsheets with ease!

## Usage

First, add a helper that allows using `SimpleSpreadsheets` easily. Note that
this is not included by default so that you can easily customize the
interface, filename, etc. Here's an example:

```ruby
def xls(title, &block)
  filename = [title, file_timestamp].join("_")
  response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}.xls\""
  SimpleSpreadsheets.render(title, &block).html_safe
end
```

In your controller, specify that you respond to `xls`. Here's an example where
people can view a list of boats in their browser, or export the same list:

```ruby
class BoatsController < ApplicationController
  respond_to :html, :xls

  def index
    @search = search

    respond_to do |format|
      format.html { @boats = Boat.paginate(page: params[:page]) }
      format.xls  { @boats = Boat.all }
    end
  end
end
```

Now, in `boats/index.xls.erb`, you can use `SimpleSpreadsheets` to render a
spreadsheet for all the boats:

```erb
<%= xls("Boats") do |xls| %>
  <% xls.row do |row| %>
    <% row.string "Manufacturer" %>
    <% row.string "Model" %>
    <% row.string "Color" %>
    <% row.string "Count" %>
  <% end %>

  <% @boats.each do |boat| %>
    <% xls.row do |row| %>
      <% row.string boat.manufacturer %>
      <% row.string boat.model %>
      <% row.string boat.color %>
      <% row.number boat.count %>
    <% end %>
  <% end %>
<% end %>
```

## Testing

`simple_spreadsheets` comes bundled with a custom RSpec matcher that you can use
from your feature specs to ensure the response is valid xls. In your spec,

```ruby
require 'simple_spreadsheets/rspec/matcher'
```

Example usage:

```ruby
scenario 'exporting to XLS' do
  click_link('Download XLS')
  expect(page).to be_valid_xls
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_spreadsheets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_spreadsheets

## Contributing

1. Fork it ( https://github.com/[my-github-username]/simple_spreadsheets/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## About Foraker Labs

<img src="http://assets.foraker.com/foraker_logo.png" width="400" height="62">

This project is maintained by Foraker Labs. The names and logos of Foraker Labs are fully owned and copyright Foraker Design, LLC.

Foraker Labs is a Boulder-based Ruby on Rails and iOS development shop. Please reach out if we can [help build your product](http://www.foraker.com).
