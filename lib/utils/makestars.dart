List<Widget> getStarIcons(double score) {
  double stars = score / 2;
  int fullStars = stars.floor();
  bool hasHalfStar = (stars - fullStars) >= 0.5;
  int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

  return [
    for (int i = 0; i < fullStars; i++)
      Icon(Icons.star_outlined, color: Colors.amber),
    if (hasHalfStar) Icon(Icons.star_half_outlined, color: Colors.amber),
    for (int i = 0; i < emptyStars; i++)
      Icon(Icons.star_outlined, color: Colors.white38),
  ];
}
