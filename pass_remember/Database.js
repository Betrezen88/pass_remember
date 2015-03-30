.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

function getDatabase() {
    return Sql.LocalStorage.openDatabaseSync("PassRemember", "1.0", "Database", 100000);
}

function createDatabase() {
    console.log("createDatabase()");
    var db = getDatabase();

    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS category (id INTEGER PRIMARY KEY AUTOINCREMENT, name CHAR(30))');
            tx.executeSql('CREATE TABLE IF NOT EXISTS account (id INTEGER PRIMARY KEY AUTOINCREMENT, login CHAR(20), password CHAR(64), source CHAR(50), description CHAR(200), categoryId INTEGER)');
        }
    )
}

function addCategory(catName) {
    console.log("addCategory()");
    console.log(catName+" | "+typeof(catName));
    var db = getDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql("INSERT INTO category VALUES(null, ?);", [catName]);
        }
    )
}

function addAccount(login, password, source, description, categoryId) {
    console.log("addAccount()")
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('INSERT INTO account VALUES(null, ?, ?, ?, ?, ?);', [login, password, source, description, categoryId]);
        }
    )
    return parseInt(ret.insertId);
}

function categories() {
    console.log("categories()");
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('SELECT * FROM category;');
        }
    )
    return ret;
}

function categoryId(name) {
    console.log("categoryId()");
    var db = getDatabase();
    var ret = 0;
    db.transaction(
        function(tx) {
            var tmp = tx.executeSql('SELECT id FROM category WHERE name = ?;', [name]);
            if (tmp.rows.item(0) !== undefined)
                ret = tmp.rows.item(0).id;
            console.log("Category: "+name+" | ID: "+ret);
        }
    )
    return ret;
}

function accounts(categoryId) {
    console.log("accounts()");
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql('SELECT * FROM account WHERE categoryId = ?;', [categoryId]);
        }
    )
    return ret;
}

function accountsByColumn(categoryId, column, frase) {
    console.log("accountsByColumn()");
    var db = getDatabase();
    var ret;
    db.transaction(
        function(tx) {
            ret = tx.executeSql("SELECT * FROM account WHERE categoryId = ? AND ? LIKE '%?%' ");
        }
    )
    return ret;
}
