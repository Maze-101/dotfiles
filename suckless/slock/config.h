/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#493e21",   /* during input */
	[FAILED] = "#857e6e",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
