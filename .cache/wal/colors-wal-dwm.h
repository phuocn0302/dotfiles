static const char norm_fg[] = "#f5ead9";
static const char norm_bg[] = "#1B1923";
static const char norm_border[] = "#414242";

static const char sel_fg[] = "#f5ead9";
static const char sel_bg[] = "#70B3B4";
static const char sel_border[] = "#f5ead9";

static const char urg_fg[] = "#f5ead9";
static const char urg_bg[] = "#616B80";
static const char urg_border[] = "#616B80";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
