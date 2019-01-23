# $poem is a jQuery object pointing to textarea
poem_length = ($poem) -> $poem.val().length

$(document).ready () ->
        $counter = $(".counter")
        $poem = $("#poem")
        poem_limit = $counter.text().split('/')[1]
        $counter.text(poem_length($poem) + '/' + poem_limit)

        $poem.on 'input propertychange', (event) ->
                $counter.text(poem_length($poem) + '/' + poem_limit)
