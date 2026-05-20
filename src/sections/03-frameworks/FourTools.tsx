// ═══════════════════════════════════════════════════════════════════
// FourTools — four classic metacognitive tools. Each has a moment
// where it fits, and a one-line classroom example.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './FourTools.module.scss';

interface Tool {
  id: string;
  number: string;
  nameHe: string;
  englishHe: string;
  whenHe: string;
  exampleHe: string;
  ledByHe: string;
}

const TOOLS: Tool[] = [
  {
    id: 'kwl',
    number: '01',
    nameHe: 'KWL',
    englishHe: 'Know · Want to know · Learned',
    whenHe: 'בפתיחת יחידה.',
    exampleHe: 'לפני יחידה על דמוקרטיה — מה אתם חושבים שאתם יודעים? מה אתם רוצים לדעת?',
    ledByHe: 'אוגדל · 1986',
  },
  {
    id: 'thinkaloud',
    number: '02',
    nameHe: 'חשיבה רועשת',
    englishHe: 'Think-Aloud',
    whenHe: 'כשתלמידים יודעים תשובה אך לא תהליך.',
    exampleHe: 'במקום "הנה התשובה" — "בואו אדבר דרך זה. קודם אני שואל את עצמי..."',
    ledByHe: 'Ericsson & Simon · 1980',
  },
  {
    id: 'exit',
    number: '03',
    nameHe: 'כרטיסי יציאה',
    englishHe: 'Exit Tickets',
    whenHe: 'בסוף שיעור — תמונת מצב מהירה.',
    exampleHe: '"מה הנקודה הכי מבלבלת אצלך כרגע מתוך השיעור?" — 60 שניות, דף קטן.',
    ledByHe: 'Marzano · Formative Assessment · 2007',
  },
  {
    id: 'selfquestion',
    number: '04',
    nameHe: 'שאילתות עצמיות',
    englishHe: 'Self-Questioning',
    whenHe: 'כשהתלמיד תקוע — כדי שיתשאל את עצמו, לא אותך.',
    exampleHe: '6 שאלות מודבקות לסוף הספר. "מה השאלה האמיתית?", "מה אני כבר יודע?", "האם בדקתי?".',
    ledByHe: 'Wong · Self-Questioning · 1985',
  },
];

const FourTools: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>ארבעת הכלים הקלאסיים</span>
      <h2 className={styles.title}>ארבעה כלים — לארבעה רגעים בשיעור.</h2>
      <p className={styles.lede}>
        אין כלי "אחד שעובד". יש <em>רגעים</em> — לכל אחד מהם, כלי. הבחירה בכלי
        הנכון לרגע הנכון — היא רוב המיומנות.
      </p>
    </header>

    <div className={styles.grid}>
      {TOOLS.map(t => (
        <article key={t.id} className={styles.tool}>
          <header className={styles.toolHead}>
            <span className={styles.num}>{t.number}</span>
            <div>
              <h3 className={styles.toolName}>{t.nameHe}</h3>
              <span className={styles.toolEn}>{t.englishHe}</span>
            </div>
          </header>

          <div className={styles.row}>
            <span className={styles.rowLabel}>מתי</span>
            <p>{t.whenHe}</p>
          </div>
          <div className={styles.row}>
            <span className={styles.rowLabel}>איך זה נשמע בכיתה</span>
            <p className={styles.example}>{t.exampleHe}</p>
          </div>
          <p className={styles.source}>{t.ledByHe}</p>
        </article>
      ))}
    </div>
  </section>
);

export default FourTools;