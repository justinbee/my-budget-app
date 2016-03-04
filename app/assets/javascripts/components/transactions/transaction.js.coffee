{tr, td, a} = React.DOM

@Transaction = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  #handleEdit: (e) ->
  #  e.preventDefault()
  #  data =
  #    title: React.findDOMNode(@refs.title).value
  #    date: React.findDOMNode(@refs.date).value
  #    amount: React.findDOMNode(@refs.amount).value
  #  $.ajax
  #    method: 'PUT'
  #    url: "/records/#{ @props.record.id }"
  #    dataType: 'JSON'
  #    data:
  #      record: data
  #    success: (data) =>
  #      @setState edit: false
  #      @props.handleEditRecord @props.record, data

	render: ->
		tr null,
			td null, @props.transaction.date
			td null, @props.transaction.payee_name
			td null, @props.transaction.amount
			td null, @props.transaction.category_name
			td null,
			  a
          className: 'btn btn-default'
          #onClick: @handleToggle
          'Edit'

