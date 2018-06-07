# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



input = $('input[type=file]')

stop = (e) ->
  e.preventDefault()
  e.stopPropagation()

uploadFile = (file) ->
  console.log input
  url = input.dataset.directUploadUrl
  upload = new DirectUpload(file, url)

  upload.create ( (error, blob) =>
    if (error)
      # // Handle the error
    else
      # // Add an appropriately-named hidden input to the form with a
      # //  value of blob.signed_id so that the blob ids will be
      # //  transmitted in the normal upload flow
      hiddenField = document.createElement('input')
      hiddenField.setAttribute("type", "hidden")
      hiddenField.setAttribute("value", blob.signed_id)
      hiddenField.name = input.name
      document.querySelector('form').appendChild(hiddenField)
  )

$ ->

  DirectUpload = require "activestorage"

  upload = (files) ->
    alert 'Upload ' + files.length + ' File(s).'

  $('.dropzone').on 'dragover', (e) ->
    stop(e)

  $('.dropzone').on 'dragenter', (e) ->
    stop(e)

  $('.dropzone').on 'drop', (e) ->
    stop(e)
    # console.log "dropped something"
    if e.originalEvent.dataTransfer
      if e.originalEvent.dataTransfer.files.length

        ###UPLOAD FILES HERE###

        upload e.originalEvent.dataTransfer.files

        files = e.originalEvent.dataTransfer.files
        for file in files
          uploadFile(file)
