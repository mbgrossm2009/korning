# Use this file to import the sales information into the
# the database.

require "pg"
require "csv"
require "pry"

def employee_id(name)
  db_connection do |conn|
    @employee = conn.exec("SELECT * FROM employee(name)")
    binding.pry
  end
end


def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

  CSV.foreach("sales.csv", :headers => true) do |row|
    employee = row[0]
    customer_and_account_no = row[1]
    product_name = row[2]
    sale_date = row[3]
    sale_amount = row[4]
    units_sold = row[5]
    invoice_no = row[6]
    invoice_frequency = row[7]
    db_connection do |conn|
      conn.exec_params(
      "INSERT INTO employee (name, email) VALUES ($1, $2)",["#{employee.split[0]} ""#{employee.split[1]}",employee.split[2]]
      );
    end

    db_connection do |conn|
        conn.exec_params(
        "INSERT INTO customer (name, acct_num) VALUES ($1, $2)",[customer_and_account_no.split[0],customer_and_account_no.split[1]]
        );
      end

      db_connection do |conn|
        conn.exec_params(
        "INSERT INTO product (name) VALUES ($1)", [product_name]
        );
      end

      db_connection do |conn|
        conn.exec_params("INSERT INTO invoice (sale_date, sale_amount, units_sold, invoice_no,invoice_frequency) VALUES ($1, $2, $3, $4, $5)", [sale_date,sale_amount,units_sold,invoice_no,invoice_frequency]
        );
    end
  end

  #take in employee =  name SELECT
