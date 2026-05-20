// ═══════════════════════════════════════════════════════════════════
// M06 · Section flow
//
// Teacher metacognition first, AI later. The teacher experiences her
// own thinking-about-thinking before any tool is introduced.
// ═══════════════════════════════════════════════════════════════════
import type { SectionId, SectionMeta } from '@/types/module.types';

export const SECTIONS: SectionMeta[] = [
  {
    id: 'opening',
    number: 1,
    path: '/opening',
    shortHe: 'פתיחה',
    titleHe: 'מטא-קוגניציה בכיתה',
    subtitleHe: 'למה חשיבה על החשיבה היא ההכפלה הלימודית הכי גדולה — ולמה אתם כבר עושים אותה',
    minutes: 25,
  },
  {
    id: 'thinkaloud',
    number: 2,
    path: '/thinkaloud',
    shortHe: 'הפער',
    titleHe: 'הפער בין מה שכתבתם למה שחשבתם',
    subtitleHe: 'תרגיל חי שחושף את הפער בין התוצר לבין החשיבה שמאחוריו',
    minutes: 20,
  },
  {
    id: 'frameworks',
    number: 3,
    path: '/frameworks',
    shortHe: 'ארבעה כלים',
    titleHe: 'ארבעה כלים מטא-קוגניטיביים',
    subtitleHe: 'KWL, חשיבה רועשת, כרטיסי יציאה, שאילתות-עצמיות. מתי כל אחד עובד.',
    minutes: 15,
  },
  {
    id: 'break',
    number: 4,
    path: '/break',
    shortHe: 'הפסקה',
    titleHe: 'הפסקה · בחירת הכיתה שלכם',
    subtitleHe: 'אוויר ומים, ואז — על איזו יחידה נעבוד בחלק האחרון',
    minutes: 15,
  },
  {
    id: 'ai',
    number: 5,
    path: '/ai',
    shortHe: 'AI נכנס',
    titleHe: 'AI כתשתית חשיבה',
    subtitleHe: 'הוא לא חושב במקום התלמיד. הוא מאפשר לתלמיד לראות איך הוא חושב. חמש כרטיסיות.',
    minutes: 25,
  },
  {
    id: 'methods',
    number: 6,
    path: '/methods',
    shortHe: 'שלוש שיטות',
    titleHe: 'שלוש שיטות עבודה',
    subtitleHe: 'KWL · חשיבה רועשת · כרטיסי יציאה. כל אחת על אתגר כיתתי אמיתי',
    minutes: 35,
  },
  {
    id: 'personal',
    number: 7,
    path: '/personal',
    shortHe: 'השיעור שלכם',
    titleHe: 'השיעור המטא-קוגניטיבי שלכם',
    subtitleHe: 'שיטה אחת, היחידה שלכם, ערכה מוכנה',
    minutes: 30,
  },
  {
    id: 'closing',
    number: 8,
    path: '/closing',
    shortHe: 'סיכום',
    titleHe: 'סיכום',
    subtitleHe: 'ארבעה שיעורים + חמש כרטיסיות. הקיט שלכם',
    minutes: 15,
  },
];

export const SECTION_BY_ID: Record<SectionId, SectionMeta> = SECTIONS.reduce(
  (acc, s) => { acc[s.id] = s; return acc; },
  {} as Record<SectionId, SectionMeta>,
);

export function getSectionIndex(id: SectionId): number {
  return SECTIONS.findIndex(s => s.id === id);
}

export function getNextSection(id: SectionId): SectionMeta | null {
  const i = getSectionIndex(id);
  return i >= 0 && i < SECTIONS.length - 1 ? SECTIONS[i + 1] : null;
}

export function getPrevSection(id: SectionId): SectionMeta | null {
  const i = getSectionIndex(id);
  return i > 0 ? SECTIONS[i - 1] : null;
}

export const TOTAL_MINUTES = SECTIONS.reduce((sum, s) => sum + s.minutes, 0);