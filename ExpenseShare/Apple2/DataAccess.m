//
//  DataAccess.m
//  Apple2
//
//  Created by jhsiao on 12/1/12.
//
//

#import "DataAccess.h"

@implementation DataAccess

- (id)init
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
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        
        if ([filemgr fileExistsAtPath: mDatabasePath ] == NO)
        {
            const char *dbpath = [mDatabasePath UTF8String];
            
            if (sqlite3_open(dbpath, &mDb) == SQLITE_OK)
            {
                char *errMsg;
                const char *sql_stmt = "CREATE TABLE IF NOT EXISTS PROFILE ("
                "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                "NAME TEXT, "
                "EMAIL TEXT, "
                "PASSWORD TEXT, "
                "OWED NUMERIC, "
                "OWE NUMERIC)";
                
                if (sqlite3_exec(mDb, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
                {
                    NSLog(@"Failed to create table");
                }
                
                sqlite3_close(mDb);
                
            } else {
                NSLog(@"Failed to open/create database");
            }
        }
    }
    return self;
}

- (void) setProfileBySignUpWithProfile:(Profile*) profile
{
    sqlite3_stmt *statement;
    
    const char *dbpath = [mDatabasePath UTF8String];
    
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
        }
        sqlite3_finalize(statement);
        sqlite3_close(mDb);
    }
    else
    {
        NSLog(@"%s: Failed to open database", __FUNCTION__);
    }
}

- (Profile*) getProfileWithEmail:(NSString*) email WithPassword:(NSString*) password
{
    const char *dbpath = [mDatabasePath UTF8String];
    sqlite3_stmt *statement = NULL;
    NSString *querySQL = nil;
    const char *query_stmt = NULL;
    NSString *nameField = nil;
    NSString *passwordField = nil;
    int err = 0;
    Profile* profile = nil;
    
    if (sqlite3_open(dbpath, &mDb) != SQLITE_OK)
    {
        goto OPEN_FAILURE;
    }
    
    querySQL = [NSString stringWithFormat: @"SELECT name, password FROM profile WHERE email=\"%@\"", email];
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
    
    if (NO == [passwordField isEqualToString:password])
    {
        goto PASSWORD_FAILURE;
    }
    
    profile = [[Profile alloc] initWithName:nameField WithEmail:email WithPassword:password];
    
PASSWORD_FAILURE:
DATABASE_FAILURE:
    sqlite3_finalize(statement);
    
STATEMENT_FAILURE:
    sqlite3_close(mDb);
    
OPEN_FAILURE:
    return profile;
}
@end
