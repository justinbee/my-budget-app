{div, h2, table, thead, tr, th, tbody} = React.DOM

@Transactions = React.createClass
	getInitialState: ->
		transactions: @props.data

	getDefaultProps: ->
		transactions: []

	render: ->
		div
			className: 'transactions'
			h2
				className: 'title'
				'Transactions'
			table
    			className: 'table table-bordered'
    			thead null,
      				tr null,
        				th null, 'Date'
        				th null, 'Title'
        				th null, 'Amount'
        				th null, 'Category'
        				th null, 'Actions'
    			tbody null,
      				for transaction in @state.transactions
        				React.createElement Transaction, key: transaction.id, transaction: transaction