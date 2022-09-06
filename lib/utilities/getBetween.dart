

String getBetween(String strSource, String strStart, String strEnd)
{
  if (strSource.contains(strStart) && strSource.contains(strEnd))
  {
    int Start, End;
    Start = strSource.indexOf(strStart, 0) + strStart.length;
    End = strSource.indexOf(strEnd, Start);
    return strSource.substring(Start, End - Start);
  }
  return "";
}