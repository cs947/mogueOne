import sqlite3
import math as m

class DB:

    def connect_to_db(self, sqlite_file='C:/Users/Aaron/Desktop/CodeBuffalo/SampleDB.db'):
        conn = sqlite3.connect(sqlite_file)
        return conn

    def finish_db(self, conn):
        conn.commit()
        conn.close()

    def view_full_table(self, conn, table_name):
        c = conn.cursor()
        c.execute('SELECT * FROM {tn}'.format(tn=table_name))
        all_rows = c.fetchall()
        print(all_rows)

    def add_user_data(self, conn, fn, ln, age, email, phone): #USER_ID autoincremented can be ignored
        c = conn.cursor()
        c.execute('INSERT INTO User_Data VALUES (null, {fn}, {ln}, {a}, {e}, {pn}, datetime(\'now\'))'.format(fn=fn, ln=ln, a=age, e=email, pn=phone))

    def update_user_data(self, conn, id, fn=None, ln=None, age=None, email=None, phone=None):
        c = conn.cursor()
        c.execute('SELECT * FROM User_Data WHERE USER_ID = {id}'.format(id=id))
        u_row = c.fetchall()
        id = u_row[0][0]
        fn = u_row[0][1] if fn == None else fn
        ln = u_row[0][2] if ln == None else ln
        age = u_row[0][3] if age == None else age
        email = u_row[0][4] if email == None else email
        phone = u_row[0][5] if phone == None else phone
        c.execute('UPDATE User_Data SET USER_ID={id}, FIRST_NAME=\'{fn}\', LAST_NAME=\'{ln}\', AGE={a}, EMAIL=\'{e}\', PHONE_NUMBER=\'{pn}\', DATE_UPDATED=datetime(\'now\') WHERE USER_ID={id}'.format(id=id, fn=fn, ln=ln, a=age, e=email, pn=phone))

    def update_user_location(self, conn, id, nlat, nlong):
        c = conn.cursor()
        c.execute('DELETE FROM User_Location WHERE USER_ID={id}'.format(id=id))
        c.execute('INSERT INTO User_Location VALUES ({id}, {ulat}, {ulong}, datetime(\'now\'))'.format(id=id, ulat=nlat, ulong=nlong))

    def Find_People(self, conn, id, radius):
        output = []
        c = conn.cursor()
        c.execute('SELECT * FROM User_Location WHERE USER_ID={id}'.format(id=id))
        orow = c.fetchall()
        olat = orow[0][1] #[0][0] is for user id's
        olong = orow[0][2]
        c.execute('SELECT * FROM User_Location WHERE USER_ID<>{id}'.format(id=id))
        all_rows = c.fetchall()
        for i in all_rows:
            user = i[0]
            ulat = i[1]
            ulong = i[2]
            d = 3958.8 * 2 * m.asin(m.sqrt((m.sin((olat - ulat) / 2)) ** 2 + m.cos(olat) * m.cos(ulat) * (m.sin((olong - ulong) / 2)) ** 2))
            if d <= radius: output.append(user)
        return output

    def Build_User_Data_Query(self, id, fn, ln, age, email, phone):
        pass

    def Build_User_Location_Query(self, id, fn, ln, age, email, phone):
        pass

    def Build_User_EXP_Query(self, id, fn, ln, age, email, phone):
        pass


if __name__ == '__main__':
    my_DB = DB()
    '''conn = my_DB.connect_to_db()
    my_DB.view_full_table(conn, 'User_Data')
    my_DB.add_user_data(conn, '\'Michael\'', '\'George\'', 47, '\'mg@cornell.edu\'', '1357908642')
    my_DB.view_full_table(conn, 'User_Data')
    my_DB.finish_db(conn)

    conn2 = my_DB.connect_to_db()
    my_DB.view_full_table(conn2, 'User_Data')
    my_DB.update_user_data(conn2, 5, email='mg1@cornell.edu')
    my_DB.view_full_table(conn2, 'User_Data')
    my_DB.finish_db(conn2)

    conn3 = my_DB.connect_to_db()
    my_DB.view_full_table(conn3, 'User_Location')
    my_DB.update_user_location(conn3, 18, 0, 0)
    my_DB.update_user_location(conn3, 18, 42.453378, -76.473288)
    my_DB.view_full_table(conn3, 'User_Location')
    my_DB.finish_db(conn3)'''

    conn4 = my_DB.connect_to_db()
    print(my_DB.Find_People(conn4, 1, 10))
    my_DB.finish_db(conn4)