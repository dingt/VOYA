-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 24, 2013 at 04:21 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `voya`
--

-- --------------------------------------------------------

--
-- Table structure for table `understand`
--

CREATE TABLE IF NOT EXISTS `understand` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `city_id` int(255) NOT NULL,
  `visit_time` varchar(1000) DEFAULT NULL,
  `history` text,
  `today` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `understand`
--

INSERT INTO `understand` (`id`, `city_id`, `visit_time`, `history`, `today`) VALUES
(1, 1, 'New England is unpredictable and becomes very cold in the winter and is prone to bouts of humidity and some surprisingly high temperatures considering the region, often topping out in the 90s, in the summer. Boston summers are warm and humid, with sunshine 60-65% of the time and typical highs in the mid 70s to high 80s F (mid to upper 20s C).', 'Massachusetts'' first governor, John Winthrop, famously called Boston a "shining city on the hill," a reference to Jerusalem and a declaration of the original settlers'' intent to build a utopian Christian colony. From the very beginning, the people who lived there declared their home to be one of the most important cities in the world. Considering that the American Revolution and modern democracy got their start thanks to Bostonians, and that Winthrop’s quote is still used in modern political speech, one could argue that they were right!\r\n\r\nThe father of American jurist Oliver Wendell Holmes, Jr. (Dr. Oliver Wendell Holmes) once called the Boston statehouse "the hub of the solar system," but common usage has expanded to the now-current Hub of the Universe. This half-serious term is all you need to know to understand Boston''s complicated self-image. Vastly important in American history, and for centuries the seat of the USA''s social elite, Boston lost prominence in the early twentieth century, largely to the cities of New York, Chicago, Los Angeles, and San Francisco. Over the past two decades, Boston has regained political, cultural, and economic importance.\r\n\r\nIn 1629, Reverend William Blackstone was the first English immigrant to arrive in the city. A year later, John Winthrop and the Massachusetts Bay Colony had followed. The Massachusetts Bay Colony were Puritan religious dissidents who had fled England to find freedom in the New World. At the time the city was called Shawmut, a name coined by Native American settlers, however now a new settlement, Winthrop had decided to rename the city Boston after his hometown in England. Because of its easily-defended harbor and the fact that it is the closest port to Europe it rapidly assumed a leading role in the fledging New England region, with a booming economy based on trade with the Caribbean and Europe. The devastating Fire of 1760 destroyed much of the town, but within a few years the city had bounced back.\r\n\r\nBoston was also a city of great intellectual potential. Many statesmen had emerged in Boston along with prestigious Schools such as Harvard and the first public school in America, Boston Latin. With the founding of these schools as well as the first printing press in New England, Boston was becoming more of a colonial society.\r\n\r\nBostonians were the instigators of the independence movement in the 18th century and the city was the center of America''s revolutionary activity during the Colonial period. Several of the first Revolutionary War skirmishes were fought there, including the Boston Massacre, The Boston Tea Party, and the battles of Lexington and Concord -which were fought nearby. Boston''s direct involvement in the Revolution ended after the Battle of Bunker Hill and, soon afterwards, the ending of the Siege of Boston by George Washington. For some time afterwards the city''s political leaders continued to have a leading role in developing of the new country''s system of government. The residents'' ardent support of independence earned the city the nickname The Cradle of Liberty.\r\n\r\nThroughout the 19th century, Boston continued to grow rapidly, assimilating outlying towns into the metropolitan core. Its importance in American culture was inestimable, and its economic and literary elite, the so-called Boston Brahmins assumed the mantle of aristocracy in the United States. Their patronage of the arts and progressive social ideals was unprecedented in the New World, and often conflicted with the city''s Puritan foundations. They helped drive unprecedented scientific, educational and social change that would soon sweep the country. The Abolitionist movement, anesthesia and the telephone are a few examples of this.\r\n\r\nAt the same time, the city''s working class swelled with immigrants from Europe. The huge Irish influx made Boston one of the most important Irish cities in the world, in or out of Ireland. Gradually the Irish laborer population climbed into city''s upper class, evidenced no better than by the continued importance of the Kennedy family in national politics.\r\n\r\nFrom the early twentieth century until the 1970s, Boston''s importance on the national stage waned. Cities in what was once the frontier, like Chicago, San Francisco, and later Los Angeles, shifted the nation''s center of gravity away from liberty''s cradle. In the past two decades, Boston''s importance and influence has increased, due to growth in higher education, health care, high technology, and financial services. It remains America''s higher educational center; during the school year, one in five Bostonians are university students. There are more college students per square foot in Boston than any other city in the Western Hemisphere.\r\n\r\nBoston''s nicknames include "Beantown", "The Hub" (shortened from Oliver Wendell Holmes'' phrase ''The Hub of the Universe''), "The City of Higher Learning" (due to the plethora of universities and colleges in the Boston area) and - particularly in the 19th century - "The Athens of America," on account of its great cultural and intellectual influence. If you don''t want to stand out as a tourist, don''t refer to Boston by any of these nicknames. Locals generally don''t use any of them, except the heavy use of "Hub" in journalism (Boston takes up more headline space).\r\n', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
