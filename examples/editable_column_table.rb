# frozen_string_literal: true

require 'glimmer-dsl-libui'

$stdout.sync = true # needed on platforms that don't flush stdout automatically, like Windows, and some Linux environments

include Glimmer

data = [
  %w[cat calm meow],
  %w[dog loyal woof],
  %w[chicken bird cock-a-doodle-doo],
  %w[horse fast neigh],
  %w[cow slow moo]
]

window('Editable column animal sounds', 400, 200) {
  horizontal_box {
    table {
      text_column('Animal')
      text_column('Description')
      text_column('Sound (Editable)') {
        editable true
      }

      cell_rows data
      
      on_edited do |row, row_data| # only fires on direct table editing
        puts "Row #{row} edited: #{row_data}"
      end
    }
  }
  
  on_closing do
    puts 'Bye Bye'
  end
}.show
