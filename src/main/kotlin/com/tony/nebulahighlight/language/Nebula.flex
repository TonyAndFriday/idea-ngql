package com.tony.nebulahighlight.language;

import com.intellij.psi.tree.IElementType;
import com.tony.nebulahighlight.language.psi.NebulaTypes;
import com.intellij.psi.TokenType;
import com.intellij.lexer.FlexLexer;

%%

%class NebulaLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

CRLF=\R
WHITE_SPACE=[\ \n\t\f]
Identifier = [:jletter:][:jletterdigit:]*
StringCharacter = [^\r\n\"\\]

Comment =  {TraditionalComment} | {LineComment} | {LineComment1}
WhiteSpace = [ \t]
TraditionalComment = "/*" [^*]* "*/" | "/**/"
LineComment = {WhiteSpace}* "//" .*
LineComment1 = {WhiteSpace}* "#" .*
StringLiteral = \" ( \\\" | [^\"\n\r] )* \"

FUNCTION=abs|floor|ceil|round|sqrt|cbrt|hypot|pow|exp|exp2|log|log2|log10
         |sin|asin|cos|acos|tan|atan|rand|rand32|rand64|collect|avg|count
         |max|min|std|sum|bit_and|bit_or|bit_xor|size|range|sign|e|pi|radians
         |strcasecmp|lower|toLower|upper|toUpper|length|trim|ltrim|rtrim|left
         |right|lpad|rpad|substr|substring|reverse|replace|split|toString|hash
         |now|date|time|datetime|id|tags|labels|properties|type|startNode|endNode
         |rank|keys|labels|nodes|range|relationships|reverse|tail|head|last|coalesce|reduc

%caseless
KEYWORD=GO|FIND|LOOKUP|FETCH|MATCH|SHOW|UNWIND|AS|TO
        |USE|SET|FROM|WHERE|INSERT|YIELD|RETURN|DESCRIBE
        |DESC|VERTEX|EDGE|EDGES|UPDATE|UPSERT|WHEN|DELETE
        |ALTER|STEPS|STEP|OVER|UPTO|REVERSELY|INDEX|INDEXES
        |REBUILDTAG|TAGS|UNION|INTERSECT|MINUS|NO|OVERWRITE
        |ADD|CREATE|DROP|REMOVE|NOT|EXISTS|WITH|CHANGE|GRANT
        |REVOKE|ON|BY|IN|DOWNLOAD|GET|OF|ORDER|INGEST|COMPACT
        |FLUSH|SUBMIT|ASC|ASCENDING|DESCENDING|DISTINCT|PROP
        |BALANCE|STOP|LIMIT|OFFSET|IS|RECOVER|FORMAT|CASE
        |EXPLAIN|PROFILE|IF|THEN|ELSE|END|_id|_type|_src|_dst|_rank
        |HOST|HOSTS|SPACE|SPACES|VALUE|VALUES|USER|USERS|PASSWORD
        |ROLE|ROLES|GOD|ADMIN|DBA|GUEST|GROUP|PARTITION|NUM|REPLICA
        |FACTOR|VID|TYPE|CHARSET|COLLATE|COLLATION|ATOMIC|ALL|ANY
        |SINGLE|NONE|REDUCE|LEADER|UUID|DATA|SNAPSHOT|SNAPSHOTS|ACCOUNT
        |JOBS|JOB|PATH|BIDIRECT|STATS|STATUS|FORCE|PART|PARTS|DEFAULT
        |HDFS|CONFIGS|TTL|DURATION|COL|GRAPH|META|STORAGE|SHORTEST|NOLOOP
        |OUT|BOTH|SUBGRAPH|CONTAINS|STARTS|ENDS|EMPTY|SKIP|OPTIONAL|GROUPS
        |ZONE|ZONES|INTO|LISTENER|ELASTICSEARCH|AUTO|FUZZY|PREFIX|REGEXP
        |WILDCARD|TEXT|SEARCH|CLIENTS|SIGN|SERVICE|RESET|PLAN|TAG

TYPE=BOOL|INT8|INT16|INT32|INT64|INT|FLOAT|DOUBLE|STRING|FIXED|TIMESTAMP|DATE|TIME|DATETIME

%state WAITING_VALUE
%state STRING

%%

<YYINITIAL> {Comment}                                         { yybegin(YYINITIAL); return NebulaTypes.COMMENT; }
<YYINITIAL> {KEYWORD}                                         { yybegin(YYINITIAL); return NebulaTypes.KEYWORD; }
<YYINITIAL> {TYPE}                                            { yybegin(YYINITIAL); return NebulaTypes.TYPE; }
<YYINITIAL> {FUNCTION}                                        { yybegin(YYINITIAL); return NebulaTypes.FUNCTION; }
<YYINITIAL> {StringLiteral}                                   { yybegin(YYINITIAL); return NebulaTypes.STRING; }
{Identifier}                                                 { yybegin(YYINITIAL); return NebulaTypes.IDENTIFIER; }

<WAITING_VALUE> {CRLF}({CRLF}|{WHITE_SPACE})+               { yybegin(YYINITIAL); return TokenType.WHITE_SPACE; }
<WAITING_VALUE> {WHITE_SPACE}+                              { yybegin(WAITING_VALUE); return TokenType.WHITE_SPACE; }
({CRLF}|{WHITE_SPACE})+                                     { yybegin(YYINITIAL); return TokenType.WHITE_SPACE; }
[^]                                                         { return TokenType.BAD_CHARACTER; }