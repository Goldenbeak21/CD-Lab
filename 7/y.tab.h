/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AND = 258,
     ASSIGN = 259,
     COLON = 260,
     COMMA = 261,
     DEF = 262,
     DIV = 263,
     DOT = 264,
     ELSE = 265,
     END = 266,
     EQ = 267,
     EXITLOOP = 268,
     FLOAT = 269,
     FROM = 270,
     FUN = 271,
     GE = 272,
     GLOBAL = 273,
     GT = 274,
     IF = 275,
     INT = 276,
     LEFT_PAREN = 277,
     LEFT_SQ_BKT = 278,
     LE = 279,
     LT = 280,
     MINUS = 281,
     MOD = 282,
     MULT = 283,
     NE = 284,
     NOT = 285,
     NUL = 286,
     OR = 287,
     PLUS = 288,
     PRINT = 289,
     PRODUCT = 290,
     READ = 291,
     RETURN = 292,
     RIGHT_PAREN = 293,
     RIGHT_SQ_BKT = 294,
     SEMICOLON = 295,
     SKIP = 296,
     STEP = 297,
     TO = 298,
     WHILE = 299,
     ID = 300,
     STRING = 301,
     INT_CONST = 302,
     FLOAT_CONST = 303,
     FORMAT = 304
   };
#endif
/* Tokens.  */
#define AND 258
#define ASSIGN 259
#define COLON 260
#define COMMA 261
#define DEF 262
#define DIV 263
#define DOT 264
#define ELSE 265
#define END 266
#define EQ 267
#define EXITLOOP 268
#define FLOAT 269
#define FROM 270
#define FUN 271
#define GE 272
#define GLOBAL 273
#define GT 274
#define IF 275
#define INT 276
#define LEFT_PAREN 277
#define LEFT_SQ_BKT 278
#define LE 279
#define LT 280
#define MINUS 281
#define MOD 282
#define MULT 283
#define NE 284
#define NOT 285
#define NUL 286
#define OR 287
#define PLUS 288
#define PRINT 289
#define PRODUCT 290
#define READ 291
#define RETURN 292
#define RIGHT_PAREN 293
#define RIGHT_SQ_BKT 294
#define SEMICOLON 295
#define SKIP 296
#define STEP 297
#define TO 298
#define WHILE 299
#define ID 300
#define STRING 301
#define INT_CONST 302
#define FLOAT_CONST 303
#define FORMAT 304




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

