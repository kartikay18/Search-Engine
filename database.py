import sqlite3

def depricated_create_db():
	conn = sqlite3.connect('db/keyword_count.db')
	c = conn.cursor()
	c.execute('CREATE TABLE keycount (keyword text, count integer)')
	conn.commit()
	c.close()

def create_db(db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute('CREATE TABLE IF NOT EXISTS keycount (keyword text, count integer)')
	conn.commit()
	c.close()

def update_entry(keyword, count, db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()

	c.execute('SELECT * FROM keycount WHERE keyword=?', (keyword,))

	result = c.fetchall()

	if not result:
		#insert into table
		c.execute('INSERT INTO keycount (keyword, count) VALUES (?,?)', (keyword, count))
	else:
		#update it
		if not len(result) == 1:
			print "oops an error has occured"
		else:
			count += int(result[0][1])
			c.execute('UPDATE keycount SET count=? WHERE keyword=?',(count, keyword))
	
	conn.commit()
	c.close()

def update_entry_multi(keyword, count, c):
	c.execute('SELECT * FROM keycount WHERE keyword=?', (keyword,))

	result = c.fetchall()

	if not result:
		#insert into table
		c.execute('INSERT INTO keycount (keyword, count) VALUES (?,?)', (keyword, count))
	else:
		#update it
		if not len(result) == 1:
			print "oops an error has occured"
		else:
			count += int(result[0][1])
			c.execute('UPDATE keycount SET count=? WHERE keyword=?',(count, keyword))

def get_top_keywords(db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()

	c.execute('SELECT * FROM keycount ORDER BY count DESC LIMIT 10')
	result = c.fetchall()
	
	conn.commit()
	c.close()

	return result

def get_top_keywords_preview(db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()

	c.execute('SELECT * FROM keycount ORDER BY count DESC LIMIT 3')
	result = c.fetchall()
	
	conn.commit()
	c.close()

	return result

def add_list_to_db(list, db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()

	for item in list:
		update_entry_multi(item, list[item], c)

	conn.commit()
	c.close()

def print_db(db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()

	for row in c.execute('SELECT * FROM keycount ORDER BY count DESC'):
		print row

	conn.commit()
	c.close()

def recreate_db(db_id):
	db = 'db/' + db_id + '.db'
	conn = sqlite3.connect(db)
	c = conn.cursor()
	c.execute('DROP TABLE keycount')
	c.execute('CREATE TABLE keycount (keyword text, count integer)')
	conn.commit()
	c.close()