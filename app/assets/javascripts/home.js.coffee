# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

DEBUG = false
#DEBUG = true

# values to fetch
VALUES = ['hostname', 'uptime', 'uname', 'cpu_info', 'cpu_temperature', 'free_spaces', 'memory_split', 'free_memory']

SPINNER_OPTION =
  color: '#A0A0A0'
  length: 3
  width: 2
  radius: 3

# fill in desired values fetched from api interfaces
fetch = (name) ->
  console.log "< fetching #{name}..." if DEBUG

  value = $("##{name}")

  # start spinner
  value.spin(SPINNER_OPTION)

  $.get("/#{name}.json", {}, (response) ->
    value.text(response[name])

    console.log "> fetched #{name}." if DEBUG

    # stop spinner
    value.spin(false)
  , 'json')

# initialize stuffs
init = ->
  for name in VALUES
    fetch name

    $("#refresh-#{name}").click (event) =>
      name = event.currentTarget.id.replace(/^refresh-/, '')
      fetch name

# on page loads,
$(document).ready(init)
$(document).on('page:load', init) # XXX - turbo-links prevents jQuery from working

