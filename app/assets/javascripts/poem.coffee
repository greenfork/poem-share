window.App = {} unless window.App?

App.textarea_length = ($textarea) -> $textarea.val().length

App.disable_button = ($button) ->
        $button.attr('disabled', true).addClass('disabled').fadeTo(500, 0.4)
App.enable_button = ($button) ->
        $button.attr('disabled', false).removeClass('disabled').fadeTo(500, 1)

App.select_textarea = ($textarea) -> $textarea.focus(); $textarea.select()


App.update_counter = ($counter, length, limit) ->
        $counter.text("#{length}/#{limit}")
        if length > limit
                $counter.addClass('red')
        else
                $counter.removeClass('red')

App.update_button_state = ($button, length, limit) ->
        if length > limit
                App.disable_button($button)
        else
                App.enable_button($button)

# Everything for $(document).ready goes here
ready = () ->
        # Custom behavior for poem#index page START

        $poem = $('[data-js-poem-textarea]')
        $counter = $('[data-js-counter]')
        $button = $('[data-js-submit-poem]')

        if $poem.length != 0
                poem_limit = parseInt($counter.text().split('/')[1])
                length = App.textarea_length($poem)
                App.update_counter($counter, length, poem_limit)
                App.update_button_state($button, length, poem_limit)

        $poem.on 'input propertychange', (event) ->
                length = App.textarea_length($poem)
                App.update_counter($counter, length, poem_limit)
                App.update_button_state($button, length, poem_limit)

        # Custom behavior for poem#index page END

        $('[data-js-select-textarea]').on 'click', ->
                App.select_textarea(this)

# We have to wrap the "ready" part into its own function to work
# correctly with Turbolinks
$ -> ready()
$(document).on 'turbolinks:load', ready
