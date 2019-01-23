# $poem is a jQuery object pointing to textarea
poem_length = ($poem) -> $poem.val().length

change_counter_state = ($counter, length, limit) ->
        $counter.text("#{length}/#{limit}")
        if length > limit
                $counter.addClass('red')
        else
                $counter.removeClass('red')

change_button_state = ($button, length, limit) ->
        if length > limit
                $button.attr('disabled', true).addClass('disabled')
                        .fadeTo(500, 0.4)
        else
                $button.attr('disabled', false).removeClass('disabled')
                        .fadeTo(500, 1)

$(document).ready () ->
        $counter = $('.counter')
        $poem = $('#poem')
        $button = $('input[type="submit"]')
        poem_limit = parseInt($counter.text().split('/')[1])
        length = poem_length($poem)
        change_counter_state($counter, length, poem_limit)
        change_button_state($button, length, poem_limit)

        $poem.on 'input propertychange', (event) ->
                length = poem_length($poem)
                change_counter_state($counter, length, poem_limit)
                change_button_state($button, length, poem_limit)
