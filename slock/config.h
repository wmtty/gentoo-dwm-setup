/* user and group to drop privileges to */
static const char *user = "ak";
static const char *group = "users";

static const char *colorname[NUMCOLS] = {
    [INIT] = "black",     /* after initialization */
    [INPUT] = "#2e3440",  /* during input */
    [FAILED] = "#5e81ac", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
