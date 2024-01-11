const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1B1923", /* black   */
  [1] = "#616B80", /* red     */
  [2] = "#70B3B4", /* green   */
  [3] = "#4284a7", /* yellow  */
  [4] = "#569F54", /* blue    */
  [5] = "#7FB76F", /* magenta */
  [6] = "#f0c674", /* cyan    */
  [7] = "#EFDFC5", /* white   */

  /* 8 bright colors */
  [8]  = "#414242",  /* black   */
  [9]  = "#808899",  /* red     */
  [10] = "#8CC2C3", /* green   */
  [11] = "#5D9DBF", /* yellow  */
  [12] = "#84BD82", /* blue    */
  [13] = "#9DC891", /* magenta */
  [14] = "#f5d9a2", /* cyan    */
  [15] = "#f5ead9", /* white   */

  /* special colors */
  [256] = "#0D0B10", /* background */
  [257] = "#EFDFC5", /* foreground */
  [258] = "#EFDFC5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
