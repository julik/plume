# frozen_string_literal: true

test "commit" do
	node = parse_stmt(<<~SQL)
		COMMIT;
	SQL

	assert_equal node.commit_kw_val, "COMMIT"
	assert_equal node.transaction_kw_val, nil
end

test "commit transaction" do
	node = parse_stmt(<<~SQL)
		COMMIT TRANSACTION;
	SQL

	assert_equal node.commit_kw_val, "COMMIT"
	assert_equal node.transaction_kw_val, "TRANSACTION"
end

test "end" do
	node = parse_stmt(<<~SQL)
		end;
	SQL

	assert_equal node.commit_kw_val, "end"
	assert_equal node.transaction_kw_val, nil
end

test "end transaction" do
	node = parse_stmt(<<~SQL)
		end transaction;
	SQL

	assert_equal node.commit_kw_val, "end"
	assert_equal node.transaction_kw_val, "transaction"
end
