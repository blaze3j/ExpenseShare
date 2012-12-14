//
//  DataAccess.m
//  Apple2
//
//  Created by jhsiao on 12/1/12.
//
//

#import "DataAccess.h"
#import "Event.h"

@implementation DataAccess

- (id) init
{
    NSString *docsDir = nil;
    NSArray *dirPaths = nil;
    
    self = [super init];
    if (self)
    {
        // Get the documents directory
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        docsDir = [dirPaths objectAtIndex:0];
        
        // Build the path to the database file
        mDatabasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"profile.db"]];
        NSLog(@"%@", mDatabasePath);
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        
        if ([filemgr fileExistsAtPath: mDatabasePath ] == NO)
        {
            const char *dbpath = [mDatabasePath UTF8String];
            
            if (sqlite3_open(dbpath, &mDb) == SQLITE_OK)
            {
                char *errMsg;
                const char *sql_stmt = "CREATE TABLE IF NOT EXISTS PROFILE ("
                "NAME TEXT, "
                "EMAIL TEXT, "
                "PASSWORD TEXT, "
                "OWED REAL, "
                "OWE REAL, "
                "GROUPNAME TEXT)";
                
                if (sqlite3_exec(mDb, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
                {
                    NSLog(@"Failed to create table, %s", errMsg);
                }
                
                sqlite3_close(mDb);
                
            } else {
                NSLog(@"Failed to open/create database");
            }
        }
    }
    return self;
}

- (int) setProfileByGroupWithProfile:(Profile *)profile
{
    sqlite3_stmt *statement;
    int err = 0;
    const char *dbpath = [mDatabasePath UTF8String];
    
    if (sqlite3_open(dbpath, &mDb) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"UPDATE PROFILE SET groupname=\"%@\" WHERE email=\"%@\"", [profile getGroup], [profile getEmail]];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(mDb, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Success to sign up database");
        } else {
            NSLog(@"Failed to sign up database");
        }
        sqlite3_finalize(statement);
        sqlite3_close(mDb);
    }
    else
    {
        NSLog(@"%s: Failed to open database", __FUNCTION__);
    }
    
    return err;
}

- (int) setProfileBySignUpWithProfile:(Profile*) profile
{
    sqlite3_stmt *statement;
    int err = 0;
    const char *dbpath = [mDatabasePath UTF8String];
    Profile* profileCheck = [self getProfileWithEmail:[profile getEmail]];
    
    if (nil != profileCheck)
    {
        NSLog(@"Cannot add profile. Existing profile");
        return 1;
    }
    
    if (sqlite3_open(dbpath, &mDb) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO PROFILE (name, email, password) VALUES (\"%@\", \"%@\", \"%@\")", [profile getName], [profile getEmail], [profile getPassword]];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(mDb, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Success to sign up databaase");
        } else {
            NSLog(@"Failed to sign up database");
            err = 1;
        }
        sqlite3_finalize(statement);
        sqlite3_close(mDb);
    }
    else
    {
        NSLog(@"%s: Failed to open database", __FUNCTION__);
        err = 1;
    }
    
    return err;
}

- (Profile*) getProfileWithEmail:(NSString*) email
{
    const char *dbpath = [mDatabasePath UTF8String];
    sqlite3_stmt *statement = NULL;
    NSString *querySQL = nil;
    const char *query_stmt = NULL;
    NSString *nameField = nil;
    NSString *passwordField = nil;
    NSNumber *owedField = nil;
    NSNumber *oweField = nil;
    NSString *groupField = nil;
    const char *groupText = NULL;
    int err = 0;
    Profile* profile = nil;
    
    if (sqlite3_open(dbpath, &mDb) != SQLITE_OK)
    {
        goto OPEN_FAILURE;
    }
    
    querySQL = [NSString stringWithFormat: @"SELECT name, password, owed, owe, groupname FROM profile WHERE email=\"%@\"", email];
    query_stmt = [querySQL UTF8String];
    
    err = sqlite3_prepare_v2(mDb, query_stmt, -1, &statement, NULL);
    if (err != SQLITE_OK)
    {
        goto STATEMENT_FAILURE;
    }
    
    if (sqlite3_step(statement) != SQLITE_ROW)
    {
        goto DATABASE_FAILURE;
    }
    
    nameField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
    passwordField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
    owedField = [NSNumber numberWithFloat:sqlite3_column_double(statement, 2)];
    oweField = [NSNumber numberWithFloat:sqlite3_column_double(statement, 3)];
    groupText = (const char *) sqlite3_column_text(statement, 4);
    groupField = (NULL == groupText) ? [[NSString alloc] initWithUTF8String:""] : [[NSString alloc] initWithUTF8String:groupText];
    
    profile = [[Profile alloc] initWithName:nameField WithEmail:email WithPassword:passwordField];
    [profile setOwed:owedField];
    [profile setOwe:oweField];
    [profile setGroup:groupField];
    
PASSWORD_FAILURE:
DATABASE_FAILURE:
    sqlite3_finalize(statement);
    
STATEMENT_FAILURE:
    sqlite3_close(mDb);
    
OPEN_FAILURE:
    return profile;
}

- (NSString*) getEventsTableNameForProfile:(Profile*) profile
{
    return [[[profile getEmail] stringByReplacingOccurrencesOfString:@"@" withString:@"_"] stringByReplacingOccurrencesOfString:@"." withString:@"_"];
}

- (int) createEventsTableForProfile:(Profile*) profile
{
    int err = 0;
    const char *dbpath = [mDatabasePath UTF8String];
    
    if (sqlite3_open(dbpath, &mDb) == SQLITE_OK)
    {
        char *errMsg;
        NSString *querySQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS EVENT_%@ ("
                              "TYPE TEXT, "
                              "FREQUENCY TEXT, "
                              "TERM TEXT, "
                              "COST REAL, "
                              "DATE REAL)",
                              [self getEventsTableNameForProfile:profile]];
        const char *sql_stmt = [querySQL UTF8String];
        
        if (sqlite3_exec(mDb, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            NSLog(@"Failed to create table, %s", errMsg);
            err = 1;
        }
        
        sqlite3_close(mDb);
        
    } else {
        NSLog(@"Failed to open/create database");
        err = 1;
    }
    return err;
}

- (NSMutableArray*) getEventsForProfile:(Profile*) profile
{
    const char *dbpath = [mDatabasePath UTF8String];
    sqlite3_stmt *statement = NULL;
    NSString *querySQL = nil;
    const char* query_stmt = NULL;
    int err = 0;
    NSString* typeField = nil;
    NSString* frequencyField = nil;
    NSString* termField = nil;
    NSNumber* costField = nil;
    NSNumber* dateField = nil;
    Event* event = nil;
    NSMutableArray* events = [NSMutableArray array];
    
    if (sqlite3_open(dbpath, &mDb) != SQLITE_OK)
    {
        goto OPEN_FAILURE;
    }
    
    querySQL = [NSString stringWithFormat: @"SELECT type, frequency, term, cost, date FROM event_%@",
                [self getEventsTableNameForProfile:profile]];
    query_stmt = [querySQL UTF8String];
    err = sqlite3_prepare_v2(mDb, query_stmt, -1, &statement, NULL);
    
    if (err != SQLITE_OK)
    {
        goto STATEMENT_FAILURE;
    }
    
    while (sqlite3_step(statement) == SQLITE_ROW)
    {
        typeField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
        frequencyField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
        termField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
        costField = [NSNumber numberWithFloat:sqlite3_column_double(statement, 3)];
        dateField = [NSNumber numberWithFloat:sqlite3_column_double(statement, 4)];
        
        event = [[Event alloc] initWithType:typeField WithFrequency:frequencyField WithTerm:termField WithCost:costField WithDateInterval:[dateField floatValue]];
        [events addObject:event];
    }
    
PASSWORD_FAILURE:
DATABASE_FAILURE:
    sqlite3_finalize(statement);
    
STATEMENT_FAILURE:
    sqlite3_close(mDb);
    
OPEN_FAILURE:
    return events;
}

- (int) setEventsForProfile:(Profile*) profile
{
    sqlite3_stmt *statement;
    int err = 0;
    const char *dbpath = [mDatabasePath UTF8String];
    char *errMsg = "";
    NSString *querySQL = nil;
    const char *sqlStmt = NULL;
    NSArray* events = [profile getEvents];
    
    if (nil == [profile getEvents] || 0 == [profile getEvents]) {
        return 0;
    }
    
    [self createEventsTableForProfile:profile];
    
    if (sqlite3_open(dbpath, &mDb) != SQLITE_OK)
    {
        NSLog(@"%s: Failed to open database", __FUNCTION__);
        goto OPEN_FAILURE;
    }
        
    querySQL = [NSString stringWithFormat:@"DELETE FROM event_%@",
                              [self getEventsTableNameForProfile:profile]];
    sqlStmt = [querySQL UTF8String];
        
    if (sqlite3_exec(mDb, sqlStmt, NULL, NULL, &errMsg) != SQLITE_OK)
    {
        NSLog(@"Failed to delete all rows in table, %s", errMsg);
        err = 1;
        goto DELETE_FAILURE;
    }
    
    for (Event* e in events)
    {
        querySQL = [NSString stringWithFormat: @"INSERT INTO event_%@  (type, frequency, term, cost, date) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%f\")",
                    [self getEventsTableNameForProfile:profile], [e getType], [e getFrequency], [e getTerm], [e getCost], [e getDateAsTimeInterval]];
        sqlStmt = [querySQL UTF8String];
        
        sqlite3_prepare_v2(mDb, sqlStmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Success to add event to database");
        } else {
            NSLog(@"Failed to add event to database");
            goto INSERT_FAILURE;
        }
        
        sqlite3_finalize(statement);
    }
    
INSERT_FAILURE:
DELETE_FAILURE:
    sqlite3_close(mDb);

OPEN_FAILURE:
    return err;
}

@end
